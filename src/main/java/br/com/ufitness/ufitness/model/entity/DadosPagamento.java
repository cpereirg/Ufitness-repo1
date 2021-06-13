package br.com.ufitness.ufitness.model.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Table(name = "dados_pagamento")
@Entity
@Getter
@Setter
public class DadosPagamento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    private String cpf;
    @Column(length = 16)
    private String cartaoCredito;
    @Column
    private Long numeroSeguranca;
    @Column
    private String CEP;
    @Column
    private String cidade;
    @Column
    private String endereco;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_cliente")
    @MapsId
    private ClientEntity clientEntity;
}
