def each(arr)

    counter = 0

    while counter < arr.size do
        yield(arr[counter])
        counter +=1
    end

    arr

end