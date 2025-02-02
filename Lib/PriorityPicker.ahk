global PriorityCardSelector := Gui("+AlwaysOnTop")
PriorityCardSelector.SetFont("s10 bold", "Segoe UI")
PriorityCardSelector.BackColor := "0c000a"
PriorityCardSelector.MarginX := 20
PriorityCardSelector.MarginY := 20

PriorityOrder := PriorityCardSelector.Add("GroupBox", "x20 y30 w180 h400 cWhite", "Modifier Priority Order")

options := ["new_path", "range", "attack", "cooldown", "explosive_death", "shield", "regen", "yen", "speed", "health"]

numDropDowns := 10
yStart := 70
ySpacing := 32

global dropDowns := []

For index, _ in options {
    if (index > numDropDowns)
        Break
    yPos := yStart + ((index - 1) * ySpacing)
    PriorityCardSelector.Add("Text", Format("x38 y{} w20 h23 +0x200 cWhite", yPos), index)
    dropDown := PriorityCardSelector.Add("DropDownList", Format("x60 y{} w120 Choose{}", yPos, index), options)
    dropDowns.Push(dropDown)

    AttachDropDownEvent(dropDown, index)
}



OpenPriorityPicker() {
    PriorityCardSelector.Show()
}

global priorityOrder := ["new_path", "range", "attack", "cooldown", "explosive_death", "shield", "regen", "yen", "speed", "health"]

AttachDropDownEvent(dropDown, index) {
    dropDown.OnEvent("Change", (*) => OnDropDownChange(dropDown, index))
}

RemoveEmptyStrings(array) {
    for index, value in array {
        if (value = "") {
            array[index] := "placeholder" ; Ensure the array retains 10 elements
        }
    }
}

OnDropDownChange(ctrl, index) {
    if (index >= 1 and index <= 10) {
        priorityOrder[index] := ctrl.Text ; Update the correct index in priorityOrder
        AddToLog(Format("Priority {} set to {}", index, ctrl.Text))
    } else {
        AddToLog(Format("Invalid index {} for dropdown", index))
    }
}








