# My Notes

### Libs da comunidade

- Link: https://pub.dev/

### Uso do .then:

- then: O método then é chamado no Future retornado por Navigator.push. Ele é executado quando a
rota (neste caso, a FormScreen) **é removida da pilha de navegação e a navegação retorna para a tela
anterior.**
- setState: Dentro do .then, o setState é chamado, o que indica ao Flutter que algo mudou no estado do
widget e que ele **precisa ser reconstruído.** 
