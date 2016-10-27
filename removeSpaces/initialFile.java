package ru.Pets;

public class Cat extends Pets{
    @Override
    void move(){
        nameOfAnAnimal = "Кошка ";
        System.out.println(nameOfAnAnimal + "крадется");
    }

    @Override
    void talk(){
        System.out.println(nameOfAnAnimal + "говорит: мяу - мяу!");
        System.out.println("");
    }
}
