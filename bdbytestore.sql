CREATE DATABASE IF NOT EXISTS bdbytestore
  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE bdbytestore;

CREATE TABLE IF NOT EXISTS pessoa (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS produto (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    valor FLOAT NOT NULL,
    data_validade DATE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS vendas (
    id_venda INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    data_venda DATE NOT NULL,
    status_venda VARCHAR(40) NOT NULL,
    valor_total FLOAT NOT NULL,
    PRIMARY KEY (id_venda),
    CONSTRAINT fk_vendas_pessoa FOREIGN KEY (id_cliente) REFERENCES pessoa(id)
);

CREATE TABLE IF NOT EXISTS itens_venda (
    id_item INT NOT NULL AUTO_INCREMENT,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario FLOAT NOT NULL,
    subtotal FLOAT NOT NULL,
    PRIMARY KEY (id_item),
    CONSTRAINT fk_itens_venda_vendas FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    CONSTRAINT fk_itens_venda_produto FOREIGN KEY (id_produto) REFERENCES produto(id)
);
