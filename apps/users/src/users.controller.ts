import { Controller } from '@nestjs/common';
import { UsersService } from './users.service';
import { MessagePattern } from '@nestjs/microservices';

export interface UserDTO {
  id: string;
  title: string;
  author: string;
  release_date: Date;
}

@Controller()
export class UsersController {
  constructor(private readonly appService: UsersService) {}

  @MessagePattern({ cmd: 'get_user' })
  getUserById(userId: string): UserDTO {
    return this.appService.getUserByID(userId);
  }
}
