import { ApiProperty } from '@nestjs/swagger';

export class AuthResponse {
  @ApiProperty()
  success: boolean;

  @ApiProperty()
  token: string;
}

export class ParsedUserData {
  @ApiProperty()
  name: string;

  @ApiProperty()
  email: string;
}
