import sys
def increment():
    version = sys.argv[1]
    bump = sys.argv[2]
    curr_num = 0
    nums = ['0','0','0']
    curr_str = ''
    for n in version:
        if n == '.':
            curr_num += 1
            curr_str = ''
            continue
        curr_str = curr_str + n
        nums[curr_num] = curr_str
    if bump == 'major':
        nums[0] = f"{int(nums[0]) + 1}"
    if bump == 'minor':
        nums[1] = f"{int(nums[1]) + 1}"
    else:
        nums[2] = f"{int(nums[2]) + 1}"

    res = '.'.join(nums)
    print(res)


increment()
