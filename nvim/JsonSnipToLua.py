import json

file = open("./snippets/json/javascript.json")
x = json.loads(file.read())

lua = "return {\n"

for k in x:
    trig = x[k]["prefix"]
    name = k
    dscr = x[k].get("description")
    body = x[k]["body"]

    lua += "\ts({\n"
    lua += "\t\ttrig = " + trig + ",\n"
    lua += "\t\tname = " + name + ",\n"
    if dscr:
        lua += "\t\tdscr = " + dscr + ",\n"
    lua += "\t\t}, {\n"
    if isinstance(body, str):
        lua += "\t\t\t"
        lua += repr(body)
        lua += "\n"
    else:
        for line in body:
            lua += "\t\t\t"
            lua += repr(line)
            lua += "\n"
    lua += "\t\t}),\n"

lua += "}"

print(lua)
