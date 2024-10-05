import json


def main():
    with open("grades.json") as f:
        data = json.load(f)

    jegyHatarok = {
        2: 0.5,
        3: 0.6,
        4: 0.75,
        5: 0.85,
    }

    haziPercent = data["haziPont"]["elert"] / data["haziPont"]["max"]
    zhPercent = data["zhPont"]["elert"] / data["zhPont"]["max"]

    for grade, neededPercent in jegyHatarok.items():
        achievedPercent = (haziPercent * 0.33) + (zhPercent * 0.33)

        neededMininetPercent = (neededPercent - achievedPercent) / 0.33
        neededMininetPont = neededMininetPercent * data["mininetPont"]["max"]

        if neededMininetPont < data["mininetPont"]["max"] * data["mininetPont"]["min"]:
            neededMininetPont = round(data["mininetPont"]["max"] * data["mininetPont"]["min"])
        elif neededMininetPont > data["mininetPont"]["max"]:
            neededMininetPont = "Remenytelen"

        if not isinstance(neededMininetPont, str):
            neededMininetPont = round(neededMininetPont)

        print(f"{grade}: {neededMininetPont}")


if __name__ == "__main__":
    main()
