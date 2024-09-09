import { Controller, Get, Inject, Param } from '@nestjs/common';
import { SERVICE_NAMES } from '../service-names';
import { ClientProxy } from '@nestjs/microservices';

@Controller('users')
export class UsersRoutesController {
  constructor(
    @Inject(SERVICE_NAMES.USERS_SERVICE) private client: ClientProxy,
  ) {}

  @Get(':id')
  getUserByID(@Param('id') id) {
    return this.client.send({ cmd: 'get_user' }, id);
  }
  
}
