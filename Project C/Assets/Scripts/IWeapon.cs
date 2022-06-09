using System;
using UnityEngine;

public interface IWeapon
{
    string anim{get;}
    int might{get;}
    int weight{get;}
    int hitCount{get;}
    bool passive{get;}
}