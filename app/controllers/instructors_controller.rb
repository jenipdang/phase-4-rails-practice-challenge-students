class InstructorsController < ApplicationController

    def index
        render json: Instructor.all
    end

    def show
        find_instructor
        render json: @instructor, serializer: InstructorWithStudentSerializer
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def update
        find_instructor
        @instructor&.update!(instructor_params)
        render json: @instructor, status: :accepted
    end

    def destroy
        find_instructor
        @instructor&.destroy
        head :no_content
    end


    private

    def instructor_params
        params.permit(:name)
    end

    def find_instructor
        @instructor = Instructor.find(params[:id])
    end


end