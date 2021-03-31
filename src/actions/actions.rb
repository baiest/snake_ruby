module Actions
    def self.move_snake(state)
        next_direction = state.next_direction
        next_position = calc_next_position(state)
        # Verificar que la siguiente casilla sea valida
        if position_is_valid?(state, next_position)
            # si es valida ->mover la serpiente
            move_snake_to(state, next_position)
        else
            # si no es valida -> terminar el juego
            end_game(state)
        end
    end

    private
    
    def calc_next_position(state)
        case state.next_direction
        when UP
            # decrementar la fila
            return new_positions = Model::Coord.new(
                new_positions.row - 1,
                new_positions.col
            )
        when RIGHT
            # incrementar columna
            return new_positions = Model::Coord.new(
                new_positions.row,
                new_positions.col + 1
            )
        when DOWN
            # incrementar la fila  
            return new_positions = Model::Coord.new(
                new_positions.row + 1,
                new_positions.col
            )
        when LEFT
            # decrementar columna
            return new_positions = Model::Coord.new(
                new_positions.row,
                new_positions.col - 1
            )
        end
    end
end