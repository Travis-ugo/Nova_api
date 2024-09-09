import { Injectable } from '@nestjs/common';
import { UserDTO } from './users.controller';

const users: UserDTO[] = [
  {
    id: '1',
    author: 'Charles',
    title: 'Mark the master',
    release_date: new Date('2000/11/14'),
  },
];

@Injectable()
export class UsersService {
  getUserByID(userId: string) {
    return users.find((b: UserDTO) => b.id == userId);
  }
}
