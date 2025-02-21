//felhasználó validálása létrhozáskor
export function validateNewUserForm(user) {
  const errors = {};
  if (!user.name) errors.name = "A név megadása kötelező.";
  if (!user.email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(user.email)) errors.email = "Érvénytelen email formátum.";
  if (user.password.length < 5) errors.password = "A jelszónak legalább 5 karakter hosszúnak kell lennie.";
  if (user.password !== user.confirmPassword) errors.confirmPassword = "A jelszavak nem egyeznek.";
  return errors;
}

//felhasználó validálása szerkesztéskor
export function validateEditForm(user) {
  const errors = {};
  if (!user.name) errors.name = "A név megadása kötelező.";
  if (!user.email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(user.email)) errors.email = "Érvénytelen email formátum.";
  if (user.password.length < 5 && user.password.length != 0) errors.password = "A jelszónak legalább 5 karakter hosszúnak kell lennie.";
  if (user.password !== user.confirmPassword) errors.confirmPassword = "A jelszavak nem egyeznek.";
  return errors;
}