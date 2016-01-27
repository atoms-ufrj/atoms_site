Web Site do Grupo ATOMS/UFRJ
============================

Este repositório contém a estrutura básica do _web site_ do grupo ATOMS/UFRJ, localizado no endereço
http://atoms.peq.coppe.ufrj.br. Essa estrutura foi construída de modo a tornar bastante simples a
alteração de conteúdo do _site_. Sendo assim, **todos os membros do grupo ATOMS** são convidados a
realizar alterações. Os arquivos de conteúdo estão no formato [Markdown], que foi criado para ser o
mais próximo possível de um texto sem formatação.

Se você desejar alterar alguma página (por exemplo, acrescentando na página _people_ um colega que
acabou de entrar no grupo), você precisará se registrar como usuário no _site_ [GitHub].

Modo Simples de Alteração
-------------------------

O modo mais simples de realizar alterações de conteúdo no _site_ ATOMS é editar, diretamente pelo
[GitHub], uma ou mais páginas contidas em:

https://github.com/atoms-ufrj/atoms_site/tree/master/pages

Você pode adicionar texto com formatação [Markdown] padrão ou usando extensões [Doxygen Markdown],
se desejar. Ao clicar em um arquivo, você verá o botão de edição (um pequeno lápis) no canto
superior direito da página. Enquanto edita, você tem disponível a opção _preview changes_. Após
terminar a edição, preencha o formulário _commit changes_ (localizado no fundo da página) e clique
na opção _create a new branch for this commit and start a pull request_. Pronto! Suas edições serão
submetidas para revisão.

Modo de Alteração Offline
-------------------------

Para realizar modificações mais profundas, incluindo as possibilidades de adicionar novas páginas,
alterar _layout_ e acrescentar ferramentas, recomenda-se fazer uma cópia do repositório `atoms_site`
no seu computador. Para isso, você vai precisar de um sistema Linux com os programas `git`,
`doxygen` e `make`. Se você utiliza o Ubuntu, pode digitar:

    sudo apt-get install git git-extras doxygen make

Após isso, você poderá copiar o repositório, compilar localmente o _site_ do ATOMS e, finalmente,
visualizá-lo no seu navegador (nos exemplos abaixo, assume-se que é o Firefox). Com a sua conexão à
Internet ativada, execute os seguintes comandos:

    git clone https://github.com/atoms-ufrj/atoms_site
    cd atoms_site
    make
    firefox en/index.html

Para alterar o conteúdo do site, edite algum dos arquivos contidos na pasta `atoms_site/pages`
(vários editores de texto, incluindo o `gedit`, apresentam _syntax highlighting_ para Markdown).
Para recompilar o _site_ com as modificações efetuadas e visualiá-lo, volte à pasta `atoms_site` e,
novamente, digite:

    make
    firefox en/index.html

Finalmente, quando tiver feito todas as alterações que desejar, execute os seguintes comandos:

    git commit -a
    git request-pull

O primeiro comando acima exigirá que você faça uma breve descrição das alterações efetuadas.

__Observação__: não apague a sua cópia local do repositório, pois ela poderá ser usada no futuro
para novas edições. Quando for editar novamente, você só precisará sincronizar a sua cópia local com
o repositório no [GitHub], o que pode ser feito a partir da pasta `atoms_site`, digitando-se:

    git pull

People & Publications
---------------------

As páginas _people_ e _publications_ são pré-processadas por ferramentas que permitem um resultado
visual diferenciado, mas com uma edição extremamente facilitada. Devido ao pré-processamento, é
necessário que novos ítens sigam estritamente a formatação dos ítens já existentes. Na página
_people_, deve-se preceder os dados descritivos de cada pessoa com o código associado a ela no
sistema Lattes. Ao se visitar um currículo Lattes, o endereço que aparece no navegador é algo como:

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

Com este projeto, espera-se que o grupo ATOMS tenha um _web site_ ativo, dinâmico e democrático,
com o qual todos os membros se sintam identificados e motivados a contribuir.

<!-- Links externos -->
[Markdown]:		https://daringfireball.net/projects/markdown/basics
[Doxygen Markdown]:	https://www.stack.nl/~dimitri/doxygen/manual/markdown.html
[GitHub]:		https://github.com

