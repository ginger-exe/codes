
// Desafio DIO.me Felipão

let pokemons = []; // array para armazenar os pokemons

// função para cadastrr novos pokemons
function cadastrarPokemon(nome, sexo, nivel, hpMax, currentHP) {
    let pokemon = {
    nome: nome,
    sexo: sexo,
    level: nivel,
    hpMax: hpMax,
    currentHP: currentHP
    
    };

    pokemons.push(pokemon); // adiciona objeto pokemon no final da array pokemons


    console.log("Nome: " + pokemon.nome + " foi cadastrado com sucesso");
    console.log("Sexo: " +  pokemon.sexo);
    console.log("Nível: " + pokemon.level);
    console.log("HP Máximo: " + pokemon.hpMax);
    console.log("HP Atual: " + pokemon.currentHP);
    console.log("-------------------------");
}

// vai puxar da função cadastrarPokemon
cadastrarPokemon("Poochyena","macho",2,13,13);
cadastrarPokemon("Zigzagoon","fêmea",2,13,13);
cadastrarPokemon("Dragonite","macho",5,25,25);
cadastrarPokemon("Dragonite","fêmea",5,24,24);
cadastrarPokemon("Dragonite","fêmea",5,24,24);
cadastrarPokemon("Poochyena","fêmea",3,15,15);
cadastrarPokemon("Wurmple","macho",2,14,7);
