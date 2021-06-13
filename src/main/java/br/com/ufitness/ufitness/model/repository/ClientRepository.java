package br.com.ufitness.ufitness.model.repository;

import br.com.ufitness.ufitness.model.entity.ClientEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends CrudRepository<ClientEntity, Long> {}
