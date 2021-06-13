package br.com.ufitness.ufitness.model.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity(name = "cliente")
@Table(name = "cliente")
@Getter
@Setter
public class ClientEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cliente")
    private Long id;
    @Column
    private String nome;
    @Column
    private String senha;
    @Column
    private String email;
    @Column
    private Boolean enabled;
    @OneToOne(mappedBy = "clientEntity")
    private DadosPagamento dadosPagamento;
}
