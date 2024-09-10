from sys import argv


def main():
    year = int(argv[1])
    print(f"{year} is a {'leap year' if isLeapYear(year) else 'common year'}.")

def isLeapYear(year: int):
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)


if __name__ == "__main__":
    main()
