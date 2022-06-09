using System;
using UnityEngine;

public interface ICharacter
{
    Sprite portrait{get;}
    string name{get;}
    int level{get; set;}
    int currentHP{get; set;}
    int currentEP{get; set;}
    int currentBP{get; set;}
    int maxHP{get;}
    int maxEP{get;}
    int attack{get;}
    int magic{get;}
    int speed{get;}
    int defense{get;}
    int resistance{get;}
    int[] resistances{get;}
    AttackTag[] attacks{get;}
    IWeapon[] weapons{get;}

    string BasicDetails()
    {
        return "Level " + level + " " + name;
    }
}