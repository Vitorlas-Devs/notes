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

    for i in jegyHatarok.keys():
        haziPercent = int(
            round(data["haziPont"]["elert"] / data["haziPont"]["max"], 2) * 100
        )
        zhPercent = int(round(data["zhPont"]["elert"] / data["zhPont"]["max"], 2) * 100)
        mininetPont = (
            (jegyHatarok[i] - zhPercent * 0.33 - haziPercent * 0.33) / 0.33
        ) * data["mininetPont"]["max"]

        kell = mininetPont
        if mininetPont < data["mininetPont"]["max"]:
            kell = data["mininetPont"]["max"] * data["mininetPont"]["min"]
        elif mininetPont > data["mininetPont"]["max"]:
            kell = "Remenytelen"

        print(f"{i} kell {kell}")


if __name__ == "__main__":
    main()
