package br.com.ufitness.ufitness.model.utility;

import br.com.ufitness.ufitness.model.ClientDTO;
import br.com.ufitness.ufitness.model.entity.ClientEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ClientUtility {
    @Autowired
    private ModelMapper modelMapper;

    public ClientEntity convertToEntity(ClientDTO clientDTO) {
        return modelMapper.map(clientDTO, ClientEntity.class);
    }
}
