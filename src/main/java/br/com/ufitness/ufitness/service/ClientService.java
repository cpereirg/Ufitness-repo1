package br.com.ufitness.ufitness.service;

import br.com.ufitness.ufitness.model.ClientDTO;
import br.com.ufitness.ufitness.model.entity.ClientEntity;
import br.com.ufitness.ufitness.model.repository.ClientRepository;
import br.com.ufitness.ufitness.model.utility.ClientUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ClientService {
    @Autowired
    private ClientRepository clientRepository;
    @Autowired
    private ClientUtility clientUtility;

    @Transactional
    public ClientEntity save(ClientDTO clientEntity) {
        ClientEntity client = convertToEntity(clientEntity);
        return clientRepository.save(client);
    }

    private ClientEntity convertToEntity(ClientDTO clientDTO) {
        return clientUtility.convertToEntity(clientDTO);
    }
}
