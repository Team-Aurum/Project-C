using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ObjectMove : MonoBehaviour
{
    IEnumerator objectCoroutine;
    bool objectCoroutineRunning = false;
    int speed = 30;
    float deltaRotation;
    public Transform cylinder;
    // Start is called before the first frame update
    void Start()
    {
        deltaRotation = cylinder.eulerAngles.x;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKey(KeyCode.S) && !objectCoroutineRunning){
            objectCoroutine = ObjectUpDown(1);
            objectCoroutineRunning = true;
            StartCoroutine(objectCoroutine);
            //transform.Translate(Vector3.down * (speed) * Time.deltaTime);
        }

        if (Input.GetKey(KeyCode.W) && !objectCoroutineRunning){
            objectCoroutine = ObjectUpDown(-1);
            objectCoroutineRunning = true;
            StartCoroutine(objectCoroutine);
        }
            //transform.Translate(-Vector3.down * (speed) * Time.deltaTime);
            // if (transform.position.z > 8)
            // {
            //     transform.Translate(new Vector3(0, (float)0.4, -1) * (speed) * Time.deltaTime);
            // }
            // else if (transform.position.z < -8 && transform.position.z > -14)
            // {
            //     transform.Translate(new Vector3(0, (float)-0.4, -1) * (speed) * Time.deltaTime);
            // }
            // else if (transform.position.z < -14)
            // {
            //     transform.Translate(new Vector3(0, (float)-0.45, -1) * (speed) * Time.deltaTime);
            // }
            // else 
            // {
            //     transform.SetPositionAndRotation(new Vector3(transform.position.x, 50, transform.position.z), transform.rotation);
            //     transform.Translate(new Vector3(0, 0, -1) * (speed) * Time.deltaTime);
            // }

        if (Input.GetKey(KeyCode.A))
            transform.Translate(Vector3.right * (speed) * Time.deltaTime);

        if (Input.GetKey(KeyCode.D))
            transform.Translate(-Vector3.right * (speed) * Time.deltaTime);
    }

    IEnumerator ObjectUpDown(int up){
        int count = 0;
        while(count < 50){
            if (transform.position.z > 8)
            {
                transform.Translate(new Vector3(0, (float)-0.4*up, up) * (speed) * Time.deltaTime);
            }
            else if (transform.position.z < -8 && transform.position.z > -14)
            {
                transform.Translate(new Vector3(0, (float)0.4*up, up) * (speed) * Time.deltaTime);
            }
            else if (transform.position.z < -14) 
            {
                transform.Translate(new Vector3(0, (float)0.45*up, up) * (speed) * Time.deltaTime);
            }
            else
            {
                transform.SetPositionAndRotation(new Vector3(transform.position.x, 50, transform.position.z), transform.rotation);
                transform.Translate(new Vector3(0, 0, 1*up) * (speed) * Time.deltaTime);
            }
            count++;
            yield return new WaitForSeconds(0.01f);
        }
         objectCoroutineRunning = false;
    }
}
