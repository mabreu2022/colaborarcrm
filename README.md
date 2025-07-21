# 📇 Sistema de Gestão de Contratos de Locação de Equipamentos

Este projeto é uma aplicação desenvolvida em **Delphi**, utilizando a biblioteca **D2Bridge Framework**, voltada para o gerenciamento de **contratos de locação de equipamentos**. O sistema permite controlar os clientes, seus contratos, os ativos locados e o status de cada operação, com foco em organização, performance e interface profissional.

---

## 🧰 Tecnologias Utilizadas

- Delphi + VCL
- FireDAC + Firebird (CHARSET UTF8)
- D2Bridge Framework
- DBGrid, DBLookupComboBox
- JSON e Integração Web
- Codificação UTF-8 ponta-a-ponta

---

## ⚙️ Funcionalidades

### 🧑‍💼 Clientes

- Cadastro de novos clientes
- Edição dos dados existentes
- Inativação via campo `ATIVO = 'N'` (soft delete)
- Busca inteligente e case-insensitive por nome/razão social
- Consulta por grid com ordenação por `NOME_RAZAO`
- Sincronização da interface com o banco via `DataModule`

### 📃 Contratos

- Registro de contratos vinculados aos clientes
- Definição dos ativos locados e datas de vigência
- Consulta por status do contrato (ativo, encerrado, em andamento)
- Possibilidade de filtrar por cliente ou situação

### 🔩 Ativos

- Cadastro de equipamentos e itens disponíveis para locação
- Controle do vínculo entre ativos e contratos
- Consulta detalhada sobre status e utilização dos ativos

### 📞 Contatos

- Cadastro e edição de contatos vinculados ao cliente
- Visualização dinâmica por `DBGrid2` com join para mostrar `NOME_RAZAO`
- Salvamento seguro via query temporária (`TFDQuery`) em tempo de execução
- Cancelamento da edição com rollback
- Sincronização automática de contatos ao mudar cliente selecionado
- Lookup via `DBLookupComboBox` para seleção clara de cliente
- Filtro ativo com `ListarContatos('', ID_CLIENTE)` e busca textual parcial

---

## 🧠 Estrutura Técnica

```
├── uDM.pas            # DataModule central: dados, queries e lógica de persistência
├── uView.Clientes.pas # Formulário principal com a interface e fluxo de interação
├── assets/            # Arquivos visuais ou complementares para a interface web (opcional)
├── README.md          # Este documento 📄
```

---

## 🧪 Detalhes Técnicos

- O campo `ATIVO` é do tipo `VARCHAR(1)` com valor default `'N'`
- Dados e queries são todos controlados exclusivamente pelo `DataModule`
- O `DBGrid2` é alimentado por uma `JOIN` entre `CONTATOS` e `CLIENTES`, exibindo `NOME_RAZAO`
- A edição de contatos com `JOIN` é resolvida via query temporária `UPDATE ... WHERE ID_CONTATO = :ID`
- A busca por nomes é insensível a maiúsculas/minúsculas com `UPPER(NOME) LIKE :nome`
- O charset da aplicação é sempre `UTF-8`, garantindo acentuação correta na web

---

## 🚀 Como Executar

1. Configure o banco Firebird com charset `UTF8`
2. Ajuste o `TFDConnection` no `DM` com:
   ```
   Conn.Params.Values['CharacterSet'] := 'UTF8';
   ```
3. Crie a tabela `CLIENTES` com campo extra:

   ```sql
   ALTER TABLE CLIENTES ADD ATIVO VARCHAR(1) DEFAULT 'N';
   ```

4. Compile e execute o projeto Delphi
5. (Opcional) Integre com a interface web utilizando os recursos do D2Bridge e JSON

---

## 🧑 Autor

Desenvolvido por **Mauricio**  
Framework de arquitetura baseado em D2Bridge por *Talis Jonatas Gomes*  
Documentado com 💙 por Microsoft Copilot
