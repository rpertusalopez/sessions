foreach(var obj in Selected.OfType<ITabularNamedObject>()) {
    var oldName = obj.Name;
    var newName = new System.Text.StringBuilder();
    for(int i = 0; i < oldName.Length; i++) {
        // First letter should always be capitalized:
        if(i == 0) newName.Append(Char.ToUpper(oldName[i]));

        // A sequence of two uppercase letters followed by a lowercase letter should have a space inserted
        // after the first letter:
        else if(i + 2 < oldName.Length && char.IsLower(oldName[i + 2]) && char.IsUpper(oldName[i + 1]) && char.IsUpper(oldName[i]))
        {
            newName.Append(oldName[i]);
            newName.Append(" ");
        }

        // All other sequences of a lowercase letter followed by an uppercase letter, should have a space
        // inserted after the first letter:
        else if(i + 1 < oldName.Length && char.IsLower(oldName[i]) && char.IsUpper(oldName[i+1]))
        {
            newName.Append(oldName[i]);
            newName.Append(" ");
        }
        else
        {
            newName.Append(oldName[i]);
        }
    }
    obj.Name = newName.ToString();
}