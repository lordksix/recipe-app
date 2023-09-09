<a name="readme-top"></a>
  <h3><b>Recipe App by Rails</b></h3>

</div>

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 \[Recipe by Rails\] ](#-recipe-by-rails-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ ](#-faq-)
  - [📝 License ](#-license-)

# 📖 [Recipe by Rails] <a name="about-project"></a>

**Recipe by Rails** is a Ruby on Rails web application with PostgreSQL as database. It allows to create recipes, private or public, and generate a shopping list from the ingredients.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
    <summary>Client</summary>
    <ul>
        <li><a href="https://www.w3.org/TR/2011/WD-html5-20110405/">HTML5</a></li>
        <li><a href="https://www.w3.org/Style/CSS/specs.en.html">CSS</a></li>
        <li><a href="https://www.ecma-international.org/publications-and-standards/standards/ecma-262/">JavaScript</a></li>
    </ul>
</details>
<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
  <summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>


### Key Features <a name="key-features"></a>

- **Gitflow**
- **Linters implemented**
- **Rubocop implemented**
- **Implement Model Migrations**
- **Implement Implement TailwindCSS**
- **Implement unit and integrations tests**
- **Implement authentication and authorization**
- **Use PostgreSQL**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

### Prerequisites

In order to run this project you need:
- To clone or fork this repo
- Ruby installed in your machine
- Ruby on Rails gem installed
- PostgreSQL install in you computer
- To modify this profile you will also need a text editor

For more information on how to install ruby on your machine:
- <a href="https://www.ruby-lang.org/en/documentation/installation/">How to install ruby</a>

### Setup

Clone this repository to your desired folder:

For example, using Ubuntu:

```sh
  cd my-desired-folder
  git clone https://github.com/lordksix/recipe-app.git
```

For more information on how to clone or fork a repository:
- <a href="https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository">How to clone a repo</a>
- <a href="https://docs.github.com/en/get-started/quickstart/fork-a-repo">How to fork a repo</a>


### Install

To install dependencies, the following command must be run in the terminal:

```sh
  cd recipe-app
  bundle install
```

To create database, migrate schema and implement initial database entries

```sh
  rails db:drop db:setup
```

### Usage

In the project directory, you can run:

```sh
  rails s
```

or

if

```sh
  ./bin/dev
```

Check on db/seed.rb for pre-loaded users, posts, comments, and likes for development

### Run tests

In the project directory, you can run:

```sh
  rspec .
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **lordksix**

- GitHub: [@lordksix](https://github.com/lordksix)
- LinkedIn: [@wladpasquel](https://www.linkedin.com/in/wladpasquel/)
- Medium: [@wladimir.pasquel](https://medium.com/@wladimir.pasquel)

👤 **Tumaini Maganiko**

- GitHub: [@githubhandle](https://github.com/tumainimaganiko)
- Twitter: [@twitterhandle](https://twitter.com/Chief2maini)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/tumainimaganiko/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

Future changes:
- Adding Inventories

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project, I encourage you to clone, fork and contribute. Our community and knowledge grows with each engagement.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

We would like to thank Microverse for the idea for this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ <a name="faq"></a>

- **Do I need a IDE or a special text editor to make changes?**

  - No, you don't. You can use NotePad to make changes.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
