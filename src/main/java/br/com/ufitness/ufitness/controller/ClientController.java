package br.com.ufitness.ufitness.controller;

import br.com.ufitness.ufitness.model.ClientDTO;
import br.com.ufitness.ufitness.model.entity.ClientEntity;
import br.com.ufitness.ufitness.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/client")
public class ClientController {
    @Autowired
    private ClientService clientService;

    @PostMapping
    public ClientEntity cadastrar(@RequestBody ClientDTO clientDTO) {
        return clientService.save(clientDTO);
    }
}