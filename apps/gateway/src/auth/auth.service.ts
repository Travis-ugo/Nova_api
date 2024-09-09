import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { ParsedUserData } from './auth.types';
import { PrismaService } from 'apps/prisma/prisma.service';

@Injectable()
export class AuthService {
  constructor(
    private jwtService: JwtService,
    private prisma: PrismaService, 
  ) {}

  async generateJwtToken(user: ParsedUserData) {
    if (!user) {
      throw new Error('User data is missing');
    }

    const { email, name } = user;

    // Check if user exists in the database
    let existingUser = await this.prisma.user.findUnique({
      where: { email },
    });

    // If user does not exist, create a new user with an empty deck
    if (!existingUser) {
      existingUser = await this.prisma.user.create({
        data: {
          email,
          name,
          decks: {
            create: [], 
          },
        },
      });
    }

    // Generate JWT payload
    const payload = {
      email: existingUser.email,
      name: existingUser.name,
    };

    // Generate JWT token
    const jwt = this.jwtService.sign(payload, {
      expiresIn: '30d',
    });

    return { jwt };
  }
}
