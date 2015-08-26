using UnityEngine;
using System.Collections;

[RequireComponent(typeof(BoxCollider))]

public class DragController : MonoBehaviour {
	void OnMouseDrag()
	{
		Vector3 point = Camera.main.ScreenToWorldPoint(Input.mousePosition);
		point.z = gameObject.transform.position.z;
		gameObject.transform.position = point;
		Cursor.visible = false;
	}
	
	void OnMouseUp()
	{
		Cursor.visible = true;
	}
//	// Use this for initialization
//	void Start () {
//	
//	}
//	
//	// Update is called once per frame
//	public float speed = 0.1F;
//	void Update () {
//		if (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Moved) {
//			Vector2 touchDeltaPosition = Input.GetTouch(0).deltaPosition;
//			transform.Translate(touchDeltaPosition.x * speed, touchDeltaPosition.y * speed, 0);
//		}
//	}

}