import { Module } from '@nestjs/common';
import { DeckController } from './deck.controller';
import { DeckService } from './deck.service';
import { PrismaService } from '../prisma/prisma.service';
import { PrismaModule } from 'apps/prisma/prisma.module';

@Module({
  imports: [PrismaModule],
  controllers: [DeckController],
  providers: [DeckService, PrismaService],
  
})
export class DeckModule {}
