# README

# Documentação Técnica: Projeto SaaS (Landing Pages)

Autor: Gusttavo Jaguar
Repositório: [saas](https://github.com/GusttavoJaguar/saas)

Visão Geral do Projeto
O projeto **SaaS** é uma aplicação web Full-Stack desenvolvida com o framework Ruby on Rails. O objetivo principal, conforme a descrição do repositório, é fornecer uma plataforma "Software as a Service" para a criação e controle de landing pages. Este é um projeto ambicioso que demonstra a capacidade de construir sistemas multi-inquilino (multi-tenant) e gerenciar recursos complexos.

Tecnologias e Ferramentas Utilizadas
A stack tecnológica é baseada no ecossistema Ruby on Rails moderno (Rails 8), incorporando as melhores práticas e ferramentas nativas para desenvolvimento ágil e escalável:


| Tecnologia | Descrição / Propósito |
| --- | --- |
| **Ruby** | Linguagem de programação principal do projeto. |
| **Ruby on Rails (v8.1.3)** | Framework web full-stack utilizado para estruturar a aplicação, gerenciar rotas, controladores, modelos e views. A versão 8 indica o uso das funcionalidades mais recentes. |
| **PostgreSQL (pg)** | Sistema de gerenciamento de banco de dados relacional (SGBD) robusto, essencial para aplicações SaaS que exigem integridade e performance. |
| **Devise** | Gem padrão da comunidade Rails para autenticação de usuários (login, registro, recuperação de senha), fundamental para qualquer sistema SaaS. |
| **Hotwire (Turbo & Stimulus)** | Tecnologias nativas do Rails para criar interfaces de usuário dinâmicas e responsivas (SPA-like) sem a complexidade de frameworks JavaScript pesados. |
| **Solid Queue / Solid Cache** | Gems introduzidas no Rails 8 que utilizam o banco de dados (PostgreSQL) para gerenciar filas de background jobs e cache, simplificando a infraestrutura (dispensando Redis). |
| **Kamal / Docker** | Ferramentas modernas de deploy e containerização, permitindo publicar a aplicação em qualquer servidor (VPS) de forma automatizada e consistente. |
| **Bootstrap / Sass** | Framework CSS e pré-processador utilizados para estilização rápida e responsiva da interface do usuário. |



Arquitetura e Funcionalidades Técnicas

1. Autenticação e Gestão de Usuários (Devise)
A presença da gem `devise` no `Gemfile` é um indicador claro de que a aplicação possui um sistema robusto de autenticação. Em um contexto SaaS, isso é o primeiro passo para gerenciar contas de clientes, planos de assinatura e permissões de acesso às funcionalidades de criação de landing pages.

2. Infraestrutura Moderna (Rails 8 + Solid)
O projeto adota as inovações do Rails 8, especificamente as gems `solid_queue` e `solid_cache`. Essa escolha arquitetural demonstra que o desenvolvedor está atualizado com as tendências do framework. Utilizar o banco de dados relacional para gerenciar jobs assíncronos (ex: envio de e-mails de boas-vindas, processamento de imagens) e cache simplifica o stack tecnológico, reduzindo custos e complexidade operacional em estágios iniciais de um SaaS.

3. Deploy Automatizado (Kamal)
A configuração do projeto com `Kamal` e `Dockerfile` revela uma visão madura sobre o ciclo de vida do software. O desenvolvedor não apenas escreve o código, mas também prepara a aplicação para ser empacotada e implantada de forma confiável em ambientes de produção, uma habilidade altamente valorizada em equipes de engenharia.

4. Processamento de Imagens (Active Storage)
A inclusão da gem `image_processing` sugere que a aplicação permite o upload e a manipulação de imagens (ex: logotipos, banners para as landing pages) utilizando o Active Storage do Rails. Isso envolve lidar com armazenamento em nuvem (S3, GCS) e redimensionamento dinâmico de arquivos de mídia.


