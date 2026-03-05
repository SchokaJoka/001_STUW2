export interface Card {
  id: string;
  text: string;
  is_black: boolean;
  created_at: string;
  updated_at: string;
  set_id: string;
}

export interface BlackCard extends Card {
  is_black: true;
}

export interface WhiteCard extends Card {
  is_black: false;
}

export interface GameMove {
  id: string;
  room_id: string;
  actor_id: string;
  seq: number;
  payload: any;
  created_at: string;
}

export interface RoomMember {
  id: string;
  room_id: string;
  user_id: string;
  role: string;
  joined_at: string;
  is_active: boolean;
  left_at: string | null;
}

export interface Room {
  id: string;
  code: string;
  owner: string;
  metadata: any;
  created_at: string;
}

export interface Set {
  id: string;
  user_id: string;
  name: string;
  created_at: string;
  updated_at: string;
}

export interface Database {
  public: {
    Tables: {
      cards: {
        Row: Card;
        Insert: Omit<Card, "id" | "created_at" | "updated_at">;
        Update: Partial<Omit<Card, "id" | "created_at" | "updated_at">>;
      };
      game_moves: {
        Row: GameMove;
        Insert: Omit<GameMove, "id" | "created_at">;
        Update: Partial<Omit<GameMove, "id" | "created_at">>;
      };
      room_members: {
        Row: RoomMember;
        Insert: Omit<RoomMember, "id" | "joined_at">;
        Update: Partial<Omit<RoomMember, "id" | "joined_at">>;
      };
      rooms: {
        Row: Room;
        Insert: Omit<Room, "id" | "created_at">;
        Update: Partial<Omit<Room, "id" | "created_at">>;
      };
      sets: {
        Row: Set;
        Insert: Omit<Set, "id" | "created_at" | "updated_at">;
        Update: Partial<Omit<Set, "id" | "created_at" | "updated_at">>;
      };
    };
  };
}
