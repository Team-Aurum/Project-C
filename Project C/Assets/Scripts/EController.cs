using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EController : MonoBehaviour
{
    public PController pController;
    public List<ICharacter> characters;

    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("EController initialized");
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void InitEnemies(List<ICharacter> enemies){
        Debug.Log("Setting Enemy Data");
        characters = enemies;
        // foreach(CharacterJSON character in enemies){
        //     characters.Add(AssembleChar(character, 20));
        // }
        // Character testChar = new Character();
        // testChar.attack = 69;
        // characters.Add(testChar);
    }

    // TODO: This entire thing might be useless now
    // public ICharacter AssembleChar(CharacterJSON tempChar, int level){
    //     ICharacter resultingChar = new ICharacter();
    //     resultingChar.maxHP = Mathf.FloorToInt((float)(tempChar.maxHP[0] + tempChar.maxHP[1] * level));
    //     resultingChar.maxEP = Mathf.FloorToInt((float)(tempChar.maxEP[0] + tempChar.maxEP[1] * level));
    //     resultingChar.attack = Mathf.FloorToInt((float)(tempChar.attack[0] + tempChar.attack[1] * level));
    //     resultingChar.magic = Mathf.FloorToInt((float)(tempChar.magic[0] + tempChar.magic[1] * level));
    //     resultingChar.speed = Mathf.FloorToInt((float)(tempChar.speed[0] + tempChar.speed[1] * level));
    //     resultingChar.defense = Mathf.FloorToInt((float)(tempChar.defense[0] + tempChar.defense[1] * level));
    //     resultingChar.resistance = Mathf.FloorToInt((float)(tempChar.resistance[0] + tempChar.resistance[1] * level));
    //     resultingChar.resistances = tempChar.resistances;
    //     //TODO: Below is subject to level restrictions, implement later
    //     resultingChar.attacks = tempChar.attacks;
    //     //These three will be pulled from save data/cached data
    //     resultingChar.level = level;
    //     resultingChar.currentHP = resultingChar.maxHP;
    //     resultingChar.currentEP = resultingChar.maxEP;
    //     return resultingChar;
    // }
}
