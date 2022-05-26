using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ciaran : ICharacter
{
    public Ciaran(int level, int currentHP, int currentEP){
        this.level = level;
        this.currentHP = currentHP;
        this.currentEP = currentEP;
    }
    public Sprite portrait{get;}
    public string name => "Ciaran";
    public int level{get; set;}
    public int currentHP{get; set;}
    public int currentEP{get; set;}
    public int maxHP{get;}
    public int maxEP{get;}
    public int attack => Mathf.FloorToInt((float)(8 + level * 0.73));
    public int magic{get;}
    public int speed{get;}
    public int defense{get;}
    public int resistance{get;}
    public int[] resistances{get;}
    public AttackTag[] attacks{get;}

    // // Start is called before the first frame update
    // void Start()
    // {
        
    // }

    // // Update is called once per frame
    // void Update()
    // {
        
    // }
}
