# Trabalho final da disciplina Classificação e Pesquisa de Dados

## Alunos

Bruna Carvalho Kaufmann, Bruno Rodrigues Bartolomasi

## Descrição

Aplicativo para cinéfilos e entusiastas do cinema, nele será mostrado uma lista de filmes
em estreia. O aplicativo será alimentado com conteúdo do The Movie DataBase
(TMDb). Cada filme possuirá informações como o seu nome, gênero e data de
lançamento.

## Funcionalidades previstas

1. Lista de filmes
2. Possibilidade de ordenar filmes
3. Busca por filme específico
4. Adicionar/remover filmes
5. Detalhes dos filmes

## Requerimentos

1. ser uma aplicação do tipo desktop que executa localmente (i.e., não pode
   ser uma aplicação Web) ou uma App para celular Smartphone;
   
2. extrair ou coletar, limpar e padronizar dados brutos provenientes da Web
   (via API ou direto de uma página) ou a partir de arquivos locais (do tipo TXT,
   CSV, XML ou similares), os quais serão a fonte de dados inicial;
   
3. após coletar ou extrair os dados, o programa deverá usar arquivos binários (estruturados) próprios, independentes dos arquivos originais, para armazenamento e persistência dos mesmos. Tais arquivos devem ser de um dos seguintes
   tipos: sequencial ou serial. Devem ser implementados com índices de acesso
   que auxiliem na consulta a esses dados, tais como árvore B/B+ ou árvore TRIE;
   
4. realizar processamento e armazenamento incremental, i.e., os dados armazenados devem ser persistidos nos arquivos de maneira a poderem ser reutilizados
   sem que precisem ser extraídos ou coletados novamente toda a vez que o programa
   for carregado. O programa também deve permitir ao usuário acrescentar, atualizar
   e remover dados carregados anteriormente;
   
5. permitir ao usuário classificar (ordenar) os dados (dos arquivos locais) em
   ordem normal e inversa;
   
6. permitir com que o usuário realize a busca ou localização (rápida) das
   informações extraídas e armazenadas nos arquivos.

## Proibições

1. não é permitido utilizar softwares de banco de dados ou similares 
   (você deve implementar suas próprias estruturas  de arquivo e índice); 
   
2. os dados não podem ficar em arrays, listas, coleções e estruturas semelhantes 
   em memória principal, mas sim usando os recursos de pesquisa associados a seus 
   arquivos de dados.