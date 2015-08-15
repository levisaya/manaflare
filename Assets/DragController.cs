using UnityEngine;
using System.Collections;

[RequireComponent(typeof(BoxCollider))]

public class DragController : MonoBehaviour
{
	void Update ()
	{
		GameObject clickedGmObj = null;
		// Left click
		if (Input.GetMouseButtonDown (0)) {
			// Nothing
		}
		// Right click
		if (Input.GetMouseButtonDown (1)) {
			clickedGmObj = GetClickedGameObject ();
			if (clickedGmObj) {
				// Tap
				var state = clickedGmObj.GetComponent<CardState>();
				if (state.tapped)
				{
					state.tapped = false;
					clickedGmObj.transform.Rotate(Vector3.forward * 90, Space.Self);
				}
				else
				{
					state.tapped = true;
					clickedGmObj.transform.Rotate (Vector3.forward * -90, Space.Self);
				}
			}
		}
		// Middle click
		if (Input.GetMouseButtonDown (2)) {
			clickedGmObj = GetClickedGameObject ();
			if (clickedGmObj) {
				// Morph
			}
		}
	}
	
	GameObject GetClickedGameObject ()
	{
		// Builds a ray from camera point of view to the mouse position
		Ray ray = Camera.main.ScreenPointToRay (Input.mousePosition);
		RaycastHit2D hit = Physics2D.Raycast (ray.origin, ray.direction);
		// Casts the ray and get the first game object hit
		if (hit) {
			return hit.transform.gameObject;
		} else {
			return null;
		}
	}
	
	void OnMouseDrag ()
	{
		Vector3 point = Camera.main.ScreenToWorldPoint (Input.mousePosition);
		point.z = gameObject.transform.position.z;
		gameObject.transform.position = point;
		Cursor.visible = false;
	}
	
	void OnMouseUp ()
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