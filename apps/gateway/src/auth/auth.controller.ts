import {
  Body,
  Controller,
  Get,
  HttpStatus,
  Post,
  Req,
  Res,
  UseGuards,
} from '@nestjs/common';
import { GoogleOauthGuard } from './guards/google-oauth.guard';
import { Request, Response } from 'express';
import { ConfigService } from '@nestjs/config';
import { AuthService } from './auth.service';
import { Public } from './public.decorator';
import { AuthResponse, ParsedUserData } from './auth.types';
import { ApiBody, ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { EnvironmentService } from '../environment/environment.service';

const controllerName = 'auth';

@ApiTags(controllerName)
@Controller(controllerName)
export class AuthController {
  constructor(
    private authService: AuthService,
    private configService: ConfigService,
    private environmentService: EnvironmentService,
  ) {}

  @Public()
  @Get('google/callback')
  @UseGuards(GoogleOauthGuard)
  async googleAuthCallback(@Req() req: Request, @Res() res: Response) {
    let token: { jwt: string };

    try {
      token = await this.authService.generateJwtToken(
        req.user as ParsedUserData,
      );
    } catch (err) {
      res
        .status(HttpStatus.INTERNAL_SERVER_ERROR)
        .send({ success: false, message: err.message });
    }

    const frontendUrl = this.configService.get<string>('FRONTEND_URL');

    res.redirect(`${frontendUrl}/oauth?token=${token.jwt}`);
  }

  @ApiOperation({ summary: 'Generate token' })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Token generated successfully.',
  })
  @ApiResponse({ status: HttpStatus.FORBIDDEN, description: 'Forbidden.' })
  @ApiBody({ type: ParsedUserData })
  @Public()
  @Post('token')
  async getTestToken(
    @Res() res: Response,
    @Body() body: ParsedUserData,
  ): Promise<Response<AuthResponse>> {
    // Should not be available in production
    if (
      this.environmentService.isDevelopment(this.configService.get('APP_ENV'))
    ) {
      try {
        const token = await this.authService.generateJwtToken(body);

        res.cookie('googleToken', token.jwt, {
          httpOnly: true,
          secure: false,
          path: '/',
          sameSite: 'none',
        });

        return res.send({ success: true, token: token.jwt });
      } catch (err) {
        res
          .status(HttpStatus.INTERNAL_SERVER_ERROR)
          .send({ success: false, message: err.message });
      }
    }

    return res.status(HttpStatus.FORBIDDEN).send('Forbidden');
  }
}
