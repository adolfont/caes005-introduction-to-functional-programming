# Desafio dos Três

Um jogo parecido com o Jogo da velha, mas que envolve 3 pessoas, 3 símbolos e a possibilidade de uma pessoa apagar o símbolo da outra (escrever por cima). O tabuleiro é  4x4. Criado com a ajuda do ChatGPT.


## Objetivo

Ser o primeiro jogador a alinhar 4 símbolos consecutivos (horizontal, vertical ou diagonal) no tabuleiro 4x4.

## Regras


1. **Número de Jogadores:** 3 jogadores.
2. **Símbolos:** Cada jogador escolhe um símbolo único (ex.: `X`, `O`, `#`).
3. **Tabuleiro:** Um grid de 4x4, inicialmente vazio.

4. **Turnos:**
   - O jogo é jogado em turnos rotativos: Jogador 1 → Jogador 2 → Jogador 3 → volta ao Jogador 1.
   - No turno, o jogador pode:
     - Colocar seu símbolo em uma célula vazia.
     - Apagar o símbolo de um oponente escrevendo por cima (substituir o símbolo).

5. **Vencedor:** 
   - O primeiro jogador a alinhar 4 de seus símbolos consecutivos (horizontalmente, verticalmente ou diagonalmente) vence.
   - Se o tabuleiro for preenchido sem um vencedor, o jogo termina em empate.

6. **Regra contra a Vingança:** 
   - Um jogador não pode apagar o símbolo que acabou de ser jogado no turno imediatamente anterior por outro jogador que apagou seu símbolo. Isso evita "vinganças instantâneas."
7. **Regra de Apagar Símbolos:**
   - Um jogador pode apagar o símbolo de outro jogador ao escrever por cima dele.
   - **Limitação:** Um jogador **não pode apagar símbolos em dois turnos consecutivos**. 
     - Se no turno anterior o jogador apagou o símbolo de outro, ele deve **obrigatoriamente jogar em uma célula vazia** no turno atual.

---

### **Exemplo de Representação do Tabuleiro Inicial:**
```
.  .  .  .
.  .  .  .
.  .  .  .
.  .  .  .
```

Onde `.` representa células vazias.




### Exemplo 1

1. Jogador 1 coloca `X` em uma célula.
2. Jogador 2 coloca `O` em outra célula.
3. Jogador 3 pode:
   - Colocar `#` em uma célula vazia.
   - Substituir o `X` ou o `O` por `#` (seguindo as regras).



### Exemplo 2

- **Turno 1:** Jogador 1 coloca `X` no tabuleiro.
- **Turno 2:** Jogador 2 coloca `O`.
- **Turno 3:** Jogador 3 apaga o `X` e coloca `#`.
- **Turno 4:** Jogador 1 **não pode apagar o `#` do Jogador 3** porque apagou no turno anterior. Ele deve jogar em uma célula vazia.

## Para implementar

- Vocẽ pode usar escript ou [mix task](https://github.com/adolfont/caes005-introduction-to-functional-programming/tree/main/offerings/2023/projects/tasks)