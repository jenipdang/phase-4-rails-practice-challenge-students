class StudentsController < ApplicationController


    #GET "/students" or "/instructors/:instructor_id/students"
    def index
        if params[:instructor_id]
            find_instructor
            students = @instructor.students
        else 
            students = Student.all
        end

        render json: students

    end

     #GET "/students/:id"
    def show 
        find_student
        render json: @student, serializer: StudentWithInstructorSerializer
    end

    def update
       find_student
       @student&.update!(student_params)
       render json: @student, status: :accepted
    end

    def create 
        find_instructor
        student = @instructor.students.create!(student_params)
        render json: student, status: :created
    end

    def destroy
        find_student
        @student&.destroy
        render json: {}, status: :no_content
    end

    private

    def find_student
        @student = Student.find(params[:id])
    end

    def find_instructor
        @instructor = Instructor.find(params[:instructor_id])
    end

    def student_params
        params.permit(:name, :major, :age)
    end

end