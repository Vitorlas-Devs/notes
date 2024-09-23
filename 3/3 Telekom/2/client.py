import json

"""
Structure of the output:

 event number. < event name >: < node1 > <-> < node2 > st:< simulation time > [- < successful/unsuccessful >] 

Ex.:

1. demand allocation: A<->C st:1 - successful
2. demand allocation: B<->C st:2 - successful
3. demand deallocation: A<->C st:5
4. demand allocation: D<->C st:6 - successful
5. demand allocation: A<->C st:7 - unsuccessful
…"""

end_points = []
demands = []


def main():
    with open("cs1.json", "r") as f:
        data = json.load(f)

        end_points = data["end-points"]
        demands = data["simulation"]["demands"]

    for i in range(len(end_points)):
        print(
            f"{i + 1}. demand allocation: {demands[i]['end-points'][0]}<->{demands[i]['end-points'][1]} st:{demands[i]['start-time']} - successful"
        )


if __name__ == "__main__":
    main()
