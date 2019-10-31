/*
Строка состоит из слов, разделенных ровно одним пробелом, пробелов перед первым и
после последнего слова нет. Поместить в начало строки слова, содержащие только символы
латинского алфавита, а затем – все остальные слова, Порядок слов внутри заданных групп не
должен изменяться.
*/
#include<iostream>
using namespace std;

int main()
{
	int const n = 301;
	char* str = new char[n];
	char* trueStr = new char[n];
	char* falseStr = new char[n];
	cin.getline(str, n);
	int counter = -1;
	int temp = 0;
	int secTemp = 0;
	int lastCounter = n - 1;
	bool lastSpace = true;
	for (;;)
	{
		counter++;
		bool emptyPlace = false;
		bool flag = true;
		bool space = false;
		temp = counter;
		secTemp = counter;
		for (; counter < n; counter++)
		{
			if (str[counter] == ' ')
			{
				space = true;
				break;
			}
			if (str[counter] == 'Н' && lastSpace == true)
			{
				space = true;
				lastSpace = false;
				str[counter] == ' ';
				break;
			}
			else if (lastSpace == false)
			{
				space = false;
				break;
			}
		}
		if (space == false)
			break;
		for (; temp <= counter; temp++)
		{
			if (emptyPlace == false && space == true)
			{
				for (int i = 'a'; i <= 'z'; i++)
				{
					if (str[temp] == i)
						break;
					if (i == 'z')
					{
						flag = false;
						break;
					}
					if (str[temp] == ' ')
						break;
					if (str[temp] == '\0')
					{
						emptyPlace = true;
						break;
					}
				}
			}
		}
		if (flag ==true)
		{
			for (int newCounter = secTemp; newCounter < temp; newCounter++)
				trueStr[newCounter] = str[newCounter];
		}
		if (flag == false)
		{
			for (;; lastCounter--)
			{

				falseStr[lastCounter] = str[secTemp];
				if (secTemp < temp - 1)
					secTemp++;
				else
				{
					lastCounter--;
					break;
				}
			}
		}
	}
	char* newStr = new char[n];
	for (int k = 0; k < n; k++)
	{
		if (trueStr[k] != 'Н' && trueStr[k] != '\0')
			newStr[k] = trueStr[k];
	}
	newStr[temp] = ' ';
	for (int j = n - 2; j > 0; j--)
	{
		newStr[j] = falseStr[lastCounter];
		if (lastCounter < n - 1)
			lastCounter++;
		else
			break;
	}
	for (int b = 0; b < n; b++)
	{
		if (newStr[b] != 'Н' && newStr[b] != '\0')
			cout << newStr[b];
	}
	delete[]falseStr;
	delete[]trueStr;
	delete[]newStr;
	delete[]str;
}
