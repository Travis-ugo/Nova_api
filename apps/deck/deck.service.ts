import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Deck } from '@prisma/client';

@Injectable()
export class DeckService {
  constructor(private prisma: PrismaService) {}

  // Fetch all decks for a user by user email
  async getUserDecks(userEmail: string): Promise<Deck[]> {
    const user = await this.prisma.user.findUnique({
      where: { email: userEmail },
    });

    if (!user) {
      throw new NotFoundException(`User with email ${userEmail} not found`);
    }

    return this.prisma.deck.findMany({
      where: { userEmail },
    });
  }

  // Create a new deck for a user by user email
  async createDeck(userEmail: string, title: string): Promise<Deck> {
    const user = await this.prisma.user.findUnique({
      where: { email: userEmail },
    });

    if (!user) {
      throw new NotFoundException(`User with email ${userEmail} not found`);
    }

    return this.prisma.deck.create({
      data: {
        title,
        userEmail, 
      },
    });
  }

  // Update a deck title by user email and deck ID
  async updateDeck(
    userEmail: string,
    deckId: number,
    title: string,
  ): Promise<Deck> {
    const user = await this.prisma.user.findUnique({
      where: { email: userEmail },
    });

    if (!user) {
      throw new NotFoundException(`User with email ${userEmail} not found`);
    }

    const existingDeck = await this.prisma.deck.findUnique({
      where: {
        id: parseInt(deckId.toString()),
        userEmail, 
      },
    });

    if (!existingDeck) {
      throw new NotFoundException(
        `Deck with ID ${deckId} not found for user ${userEmail}`,
      );
    }

    return this.prisma.deck.update({
      where: { id: parseInt(deckId.toString()) },
      data: { title },
    });
  }

  // Delete a deck by user email and deck ID
  async deleteDeck(userEmail: string, deckId: number): Promise<Deck> {
    const user = await this.prisma.user.findUnique({
      where: { email: userEmail },
    });

    if (!user) {
      throw new NotFoundException(`User with email ${userEmail} not found`);
    }

    const existingDeck = await this.prisma.deck.findUnique({
      where: {
        id: parseInt(deckId.toString()),
        userEmail, 
      },
    });

    if (!existingDeck) {
      throw new NotFoundException(
        `Deck with ID ${deckId} not found for user ${userEmail}`,
      );
    }

    return this.prisma.deck.delete({
      where: { id: parseInt(deckId.toString()) },
    });
  }
}
