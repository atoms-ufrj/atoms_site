Web Site do Grupo ATOMS/UFRJ
============================

Este repositório contém a estrutura básica do _web site_ do grupo ATOMS/UFRJ, localizado no endereço
http://atoms.peq.coppe.ufrj.br. Essa estrutura foi construída de modo a tornar bastante simples a
alteração de conteúdo do _site_. Sendo assim, **todos os membros do grupo ATOMS** são convidados a
realizar alterações. Os arquivos de conteúdo estão no formato [Markdown] (com algumas extensões
do [Doxygen]), que foi criado para ser o mais próximo possível de um texto sem formatação.

Se você desejar alterar alguma página (por exemplo, acrescentando na página _people_ um colega que
acabou de entrar no grupo), você precisará se registrar como usuário no _site_ [GitHub].

Modo Simples de Alteração
-------------------------

O modo mais simples de alterar conteúdo do _site_ ATOMS é editar páginas diretamente pelo [GitHub].
Para isso, você deverá acessar o repositório [atoms_site] e clicar no botão _fork_, para que uma
cópia seja criada no seu perfil. Trocando `<user-name>` pelo seu _login_ no GitHub, acesse:

    https://github.com/<user-name>/atoms_site

Entre na pasta `pages` e escolha um arquivo para editar. Ao clicar nele, você verá o botão de edição
(um lápis) no canto superior direito. Adicione texto com formatação similar à já existente. Enquanto
edita, você terá disponível a opção `preview changes`. Ao terminar, vá ao fundo da página e clique
no botão verde `commit changes`. Repita o procedimento com todos os arquivos que desejar alterar.
Finalmente, volte para a pasta principal (a do endereço acima), clique em `new pull request`. Ao
confirmar, suas edições serão submetidas a revisão.

Modo de Alteração Offline
-------------------------

Para realizar modificações mais profundas, incluindo as possibilidades de adicionar novas páginas,
alterar _layout_ e acrescentar ferramentas, recomenda-se fazer uma cópia do repositório `atoms_site`
no seu computador. Para isso, você vai precisar de um sistema Linux com os programas `git`, `curl`,
`doxygen` e `make`. Se você utiliza o Ubuntu, pode digitar:

    sudo apt-get install git curl doxygen make

Após isso, você poderá copiar o repositório, compilar localmente o _site_ do ATOMS e, finalmente,
visualizá-lo no seu navegador (nos exemplos abaixo, assume-se que é o Firefox). Comece criando um
_fork_ do repositório [atoms_site] no seu perfil, tal como explicado acima. Com a sua conexão à
Internet ativada e substituindo `<user-name>` pelo seu _login_ no GitHub, execute os comandos:

    git clone https://github.com/<user-name>/atoms_site
    cd atoms_site
    make
    firefox en/index.html

Para alterar o conteúdo do site, edite algum dos arquivos contidos na pasta `atoms_site/pages`
(vários editores de texto, incluindo o `gedit`, apresentam _syntax highlighting_ para Markdown).
Para recompilar o _site_ com as modificações efetuadas e visualiá-lo, volte à pasta `atoms_site` e,
novamente, digite:

    make
    firefox en/index.html

Quando tiver feito todas as alterações que desejar, execute os seguintes comandos:

    git commit -a
    git push

O primeiro comando acima exigirá que você faça uma breve descrição das alterações efetuadas. O
segundo commando atualizará o seu _fork_ no site do [GitHub]. Finalmente, entre no site, acesse o
_fork_ e clique em `compare & pull request`.

__Observação__: não apague a sua cópia local do repositório, pois ela poderá ser usada no futuro
para novas edições. Quando for editar novamente, você só precisará sincronizar a sua cópia local com
o repositório [atoms_site], o que pode ser feito a partir da sua pasta `atoms_site` local,
digitando-se:

    git remote add upstream https://github.com/atoms-ufrj/atoms_site
    git fetch upstream
    git merge upstream/master

People & Publications
---------------------

As páginas _people_ e _publications_ são pré-processadas por ferramentas que permitem um resultado
visual diferenciado, mas com uma edição extremamente facilitada. Devido ao pré-processamento, é
necessário que novos ítens sigam estritamente a formatação dos ítens já existentes. Na página
_people_, deve-se preceder os dados descritivos de cada pessoa com o código associado a ela no
sistema Lattes. Ao se visitar um currículo Lattes, o endereço que aparece no navegador é algo como.

 
 http://buscatextual.cnpq.br/buscatextual/visualizacv.do?id=K4787572D1
 

Nesse caso, o código que deve preceder o nome da pessoa no arquivo `people.md` é K4787572D1. Somente
adicione um novo membro quando tiver o seu código Lattes a disposição.

Na página _publications_, a ferramenta de pré-processamento necessita apenas do código DOI (Digital
Object Identifier) associado à publicação. Normalmente, esse código é disponibizado pela editora
logo após o artigo ser aceito para publicação. Nesse momento, você já pode adicionar sua nova
publicação no _site_ do ATOMS, bastando acrescentar no arquivo `publications.md` uma linha tal como:

    DOI: 10.1007/s10450-014-9644-6

Conclusão
---------

Com este projeto, espera-se que o grupo "ATOMS" tenha um _web site_ ativo, dinâmico e democrático,
com o qual todos os membros se sintam identificados e motivados a contribuir.

<!-- Links -->
[Markdown]:		https://daringfireball.net/projects/markdown/basics
[Doxygen]:		https://www.stack.nl/~dimitri/doxygen/manual/markdown.html
[GitHub]:		https://github.com
[atoms_site]:		https://github.com/atoms-ufrj/atoms_site
