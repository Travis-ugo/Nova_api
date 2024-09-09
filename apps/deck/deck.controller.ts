import {
  Controller,
  Get,
  UseGuards,
  Request,
  Body,
  Post,
  Patch,
  Param,
  Delete,
  HttpCode,
} from '@nestjs/common';

import { DeckService } from './deck.service';
import { JwtGuard } from 'apps/gateway/src/auth/guards/jwt-auth.guard';
import { Deck } from '@prisma/client';

@Controller('decks')
export class DeckController {
  constructor(private readonly deckService: DeckService) {}

  // Get all decks for a specific user by email
  @UseGuards(JwtGuard)
  @Get()
  async getUserDecks(@Request() req) {
    const userEmail = req.user.email;
    return this.deckService.getUserDecks(userEmail);
  }

  // Create a new deck for the user by email
  @UseGuards(JwtGuard)
  @Post()
  @HttpCode(201)
  async createDeck(
    @Request() req,
    @Body('title') title: string,
  ): Promise<Deck> {
    const userEmail = req.user.email;
    return this.deckService.createDeck(userEmail, title);
  }

  // Modify a deck by user email and deck ID
  @UseGuards(JwtGuard)
  @Patch(':id')
  async modifyDeck(
    @Request() req,
    @Param('id') id: number,
    @Body('title') title: string,
  ): Promise<Deck> {
    const userEmail = req.user.email;
    return this.deckService.updateDeck(userEmail, id, title);
  }

  // Remove a deck by user email and deck ID
  @UseGuards(JwtGuard)
  @Delete(':id')
  @HttpCode(204)
  async removeDeck(@Request() req, @Param('id') id: number): Promise<void> {
    const userEmail = req.user.email;
    await this.deckService.deleteDeck(userEmail, id);
  }
}
