#include <stdio.h>
#include <stdlib.h>

struct Job
{
    int id;
    int profit;
    int deadline;
};

int cmpfunc(const void *a, const void *b)
{
    struct Job *jobA = (struct Job *)a;
    struct Job *jobB = (struct Job *)b;
    return jobB->profit - jobA->profit;
}

void schedule_jobs(struct Job *jobs, int n)
{
    qsort(jobs, n, sizeof(struct Job), cmpfunc);
    int max_deadline = 0;
    for (int i = 0; i < n; i++)
    {
        if (jobs[i].deadline > max_deadline)
            max_deadline = jobs[i].deadline;
    }
    int *schedule = (int *)calloc(max_deadline, sizeof(int));
    for (int i = 0; i < n; i++)
    {
        int deadline = jobs[i].deadline - 1;
        while (deadline >= 0 && schedule[deadline] != 0)
            deadline--;
        if (deadline >= 0)
            schedule[deadline] = jobs[i].id;
    }

    printf("Scheduled jobs: ");
    int total_profit = 0;
    for (int i = 0; i < max_deadline; i++)
    {
        if (schedule[i] != 0)
        {
            printf("Job%d ", schedule[i]);
            for (int j = 0; j < n; j++)
            {
                if (jobs[j].id == schedule[i])
                {
                    total_profit += jobs[j].profit;
                    break;
                }
            }
        }
    }
    printf("\nTotal profit: %d\n", total_profit);
    free(schedule);
}

int main()
{
    printf("Job Scheduling with Deadlines in C\n");
    struct Job jobs[] = {{1, 3, 1}, {2, 5, 3}, {3, 20, 4}, {4, 18, 3}, {5, 1, 2}, {6, 6, 1}, {7, 30, 2}};
    int n = sizeof(jobs) / sizeof(struct Job);
    schedule_jobs(jobs, n);
    return 0;
}
