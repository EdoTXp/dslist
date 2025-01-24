package com.deiovannagroup.dslist.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deiovannagroup.dslist.dto.GameDTO;
import com.deiovannagroup.dslist.dto.GameMinDTO;
import com.deiovannagroup.dslist.entities.Game;
import com.deiovannagroup.dslist.projections.GameMinProjection;
import com.deiovannagroup.dslist.repositories.GameRepository;

@Service
public class GameService {

    private final GameRepository gameRepository;

    public GameService(GameRepository gameRepository) {
        this.gameRepository = gameRepository;
    }

    @Transactional(readOnly = true)
    public GameDTO findByid(Long id) {
        Game result = gameRepository.findById(id).orElseThrow(() -> new RuntimeException("Game not found"));
        return new GameDTO(result);
    }

    @Transactional(readOnly = true)
    public List<GameMinDTO> findAll() {
        List<Game> result = gameRepository.findAll();
        return result.stream().map(GameMinDTO::new).toList();
    }

    @Transactional(readOnly = true)
    public List<GameMinDTO> findByList(Long listId) {
        List<GameMinProjection> result = gameRepository.searchByList(listId);
        return result.stream().map(GameMinDTO::new).toList();
    }

}
