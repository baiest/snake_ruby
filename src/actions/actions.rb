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

    def position_is_valid?(state, position)
        # Verificar que este en la grilla
        is_invalid = ((position.row > state.grid.rows
        || position.row < 0)
        || (position.col >= state.grid.cols
        || position.col < 0))
        # verificar que no este superponiendo a la serpiente
        
        return false if is_invalid

        return !(state.snake.positions.include? position)
    end

    def move_snake_to(state, next_position)
        new_positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        return state
    end

    def end_game(state)
        state.game_over = true
        return state
    end
end