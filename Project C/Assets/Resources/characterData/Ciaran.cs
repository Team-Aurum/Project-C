using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ciaran : ICharacter
{
    public Ciaran(int level, int currentHP, int currentEP){
        this.level = level;
        this.currentHP = currentHP;
        this.currentEP = currentEP;
        this.currentBP = 0;
    }
    public Sprite portrait => Resources.Load<Sprite>("Textures/CiaranPortrait");
    public string name => "Ciaran";
    public int level{get; set;}
    public int currentHP{get; set;}
    public int currentEP{get; set;}
    public int currentBP{get; set;}
    public int maxHP => Mathf.FloorToInt((float)(90 + level * 9.19));
    public int maxEP => Mathf.FloorToInt((float)(90 + level * 9.19));
    public int attack => Mathf.FloorToInt((float)(8 + level * 0.73));
    public int magic => Mathf.FloorToInt((float)(8 + level * 0.73));
    public int speed => Mathf.FloorToInt((float)(8 + level * 0.73));
    public int defense => Mathf.FloorToInt((float)(8 + level * 0.73));
    public int resistance => Mathf.FloorToInt((float)(8 + level * 0.73));
    public int[] resistances => new int[] {2,3,0,1};
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
