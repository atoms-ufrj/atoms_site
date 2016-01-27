Web Site do Grupo ATOMS/UFRJ
============================

Este repositório contém a estrutura básica do web site do grupo ATOMS/UFRJ, localizado no endereço
http://atoms.peq.coppe.ufrj.br. Essa estrutura foi construída de modo a tornar bastante simples a
alteração de conteúdo da página. Sendo assim, **todos os membros do grupo ATOMS** são convidados a
realizar alterações. Os arquivos de conteúdo do web site estão no formato [Markdown], que foi criado
para ser o mais próximo possível de um texto sem formatação.

Instruções para Alteração
-------------------------

Se você desejar alterar uma página (por exemplo, adicionando na página "people" um colega que acabou
de entrar no grupo), você precisará se registrar no site [GitHub]. Os arquivos que contém o conteúdo
do site encontram-se na seguinte pasta:

https://github.com/atoms-ufrj/atoms_site/tree/master/pages

Há diversas maneiras de realizar alterações. O modo mais simples é editar os arquivos diretamente
no [GitHub]. Você pode adicionar texto com formatação [Markdown] padrão ou usando extensões
[Doxygen Markdown], se desejar. Ao clicar em um arquivo, você verá o botão de edição no canto
superior direito da página. Enquanto edita, você tem disponível a opção "preview changes". Após
terminar a edição, preencha o formulário "commit changes" (localizado no fundo da página) e clique
na opção "Create a new branch for this commit and start a pull request". Pronto! Suas edições serão
submetidas para revisão.

Para realizar alterações mais profundas, recomenda-se fazer uma cópia deste repositório no seu
computador. Para isso, você vai precisar de um sistema Linux com os programas `git`, `doxygen` e
`make`. Se você usa o Ubuntu, pode digitar:

    sudo apt-get install git doxygen make

Após isso, você pode copiar o repositório, compilar o site do ATOMS localmente e, finalmente,
visualizá-lo no seu navegador (Firefox, por exemplo). Com sua conexão à Internet ativada, execute
os seguintes comandos:

    git clone https://github.com/atoms-ufrj/atoms_site
    cd atoms_site
    make
    firefox en/index.html

Para alterar o conteúdo do site, edite algum dos arquivos contidos na pasta `atoms_site/pages`
usando.  Para visualizar a página com as modificações efetuadas, volte à pasta `atoms_site` e,
novamente, digite:

    make
    firefox en/index.html

Finalmente, quando tiver feito todas as alterações que desejar, execute os seguintes comandos:

    git commit -a
    git push

__Observação__: após terminar, não apague a sua cópia local do repositório, pois ela poderá ser
usada no futuro para outras edições. Quando for editar novamente, você só precisará sincronizar a
cópia local com o repositório no [GitHub]. Para isso, basta entrar na pasta `atoms_site` e digitar:

    git pull

<!-- Links externos -->
[Markdown]:		https://daringfireball.net/projects/markdown/basics
[Doxygen Markdown]:	https://www.stack.nl/~dimitri/doxygen/manual/markdown.html
[GitHub]:		https://github.com

