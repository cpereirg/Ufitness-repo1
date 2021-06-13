package br.com.ufitness.ufitness.model;

import br.com.ufitness.ufitness.model.entity.DadosPagamento;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClientDTO {
    private Long id;
    private String nome;
    private String senha;
    private String email;
    private Boolean enabled;
    private DadosPagamento dadosPagamento;
}
