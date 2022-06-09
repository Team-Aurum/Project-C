using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CircuitBlade : IWeapon
{
    public string anim => "Slash";
    public int might => 10;
    public int weight => 5;
    public int hitCount => 1;
    public bool passive => false;
}