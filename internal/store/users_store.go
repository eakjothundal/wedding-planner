package store

type User struct {
	ID int `json:"id"`
	FirebaseUID string `json:"firebase_uid"`
	Email string `json:"email"`
	FirstName string `json:"first_name"`
	LastName string `json:"last_name"`
	Role string `json:"role"`
}